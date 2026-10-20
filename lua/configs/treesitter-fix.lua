-- Compatibility shim: nvim-treesitter `master` (deprecated) vs Neovim >= 0.12
--
-- Neovim 0.12 removed the `all` option from query.add_directive/add_predicate,
-- so directive handlers now ALWAYS receive `match[capture_id]` as a list of
-- nodes (TSNode[]) instead of a single TSNode. nvim-treesitter master still
-- assumes the old single-node semantics, so its markdown injection directive
-- passes a Lua table into get_node_text() -> node:range() and crashes with
-- "attempt to call method 'range' (a nil value)". This also breaks fenced
-- code-block injection highlighting and makes nvim-treesitter-context error.
--
-- We force-override the affected directives with list-aware versions. This
-- module must be required AFTER nvim-treesitter has registered its handlers.

-- Only needed on Neovim >= 0.12 where `match[id]` is a list.
if vim.fn.has "nvim-0.12" ~= 1 then
  return
end

-- Ensure nvim-treesitter's own directives are registered first so our
-- force-override wins the race.
pcall(require, "nvim-treesitter.query_predicates")

local query = require "vim.treesitter.query"
local opts = { force = true, all = false }

-- Unwrap the (possibly list-valued) capture into a single node.
local function first_node(match, id)
  local v = match[id]
  if type(v) == "table" and v.id == nil then
    -- list of nodes (Neovim >= 0.12)
    return v[1]
  end
  return v
end

local html_script_type_languages = {
  ["importmap"] = "json",
  ["module"] = "javascript",
  ["application/ecmascript"] = "javascript",
  ["text/ecmascript"] = "javascript",
}

local non_filetype_match_injection_language_aliases = {
  ex = "elixir",
  pl = "perl",
  sh = "bash",
  uxn = "uxntal",
  ts = "typescript",
}

local function get_parser_from_markdown_info_string(injection_alias)
  local m = vim.filetype.match { filename = "a." .. injection_alias }
  return m or non_filetype_match_injection_language_aliases[injection_alias] or injection_alias
end

query.add_directive("set-lang-from-info-string!", function(match, _, bufnr, pred, metadata)
  local node = first_node(match, pred[2])
  if not node then
    return
  end
  local injection_alias = vim.treesitter.get_node_text(node, bufnr):lower()
  metadata["injection.language"] = get_parser_from_markdown_info_string(injection_alias)
end, opts)

query.add_directive("set-lang-from-mimetype!", function(match, _, bufnr, pred, metadata)
  local node = first_node(match, pred[2])
  if not node then
    return
  end
  local type_attr_value = vim.treesitter.get_node_text(node, bufnr)
  local configured = html_script_type_languages[type_attr_value]
  if configured then
    metadata["injection.language"] = configured
  else
    local parts = vim.split(type_attr_value, "/", {})
    metadata["injection.language"] = parts[#parts]
  end
end, opts)

query.add_directive("downcase!", function(match, _, bufnr, pred, metadata)
  local id = pred[2]
  local node = first_node(match, id)
  if not node then
    return
  end
  local text = vim.treesitter.get_node_text(node, bufnr, { metadata = metadata[id] }) or ""
  if not metadata[id] then
    metadata[id] = {}
  end
  metadata[id].text = string.lower(text)
end, opts)

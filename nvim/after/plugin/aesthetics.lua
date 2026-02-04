local Type = "#94DD8E"
local Keyword = "blue"
local Constant = "magenta"
local Comment = "yellow"
local String = "orange"
local NormalFG = "#FFFFFF"
local NormalBG = "NONE"

local NeutralFG = NormalFG

local function set_hl(name, fg, bg, style)
        vim.api.nvim_set_hl(0, name, {
                fg = fg,
                bg = bg or "NONE",
                bold = style and style.bold or false,
                italic = style and style.italic or false,
                underline = style and style.underline or false,
        })
end

vim.cmd("highlight clear")
vim.opt.background = "dark"
set_hl("Normal", NormalFG, NormalBG)
set_hl("NormalFloat", NormalFG, "#1e1e1e")

set_hl("Identifier", NeutralFG)
set_hl("Variable", NeutralFG)
set_hl("TSVariable", NeutralFG)
set_hl("TSParameter", NeutralFG)

-- Function Name (Calls and Definitions)
set_hl("Function", NeutralFG)
set_hl("TSFunction", NeutralFG)
set_hl("TSCall", NeutralFG)
set_hl("Method", NeutralFG)

-- Type (e.g., int, string, table, class names)
set_hl("String", String)
set_hl("Type", Type)
set_hl("TSType", Type)
set_hl("Special", Type)

-- Keyword (e.g., if, else, for, local, return)
set_hl("Keyword", Keyword)
set_hl("TSKeyword", Keyword)
set_hl("Statement", Keyword)
set_hl("Conditional", Keyword)
set_hl("Repeat", Keyword)
set_hl("Constant", Constant)

-- set_hl("Operator", Punctuation)
-- set_hl("TSOperator", Punctuation)
-- set_hl("Delimiter", NormalFG)

-- Comment
set_hl("Comment", Comment)

function ColorMyPencils(color)
    color = color or "spaceduck"
    vim.cmd.colorscheme(color)
    vim.cmd("TransparentEnable")
end

ColorMyPencils()

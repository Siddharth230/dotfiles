return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local dashboard = require("alpha.themes.dashboard")
    vim.cmd("source ~/.cache/wal/colors-wal.vim")
    local color16 = vim.g.color16 or "#ffffff"
    local color15 = vim.g.color15 or "#ffffff"
    local color14 = vim.g.color14 or "#ffffff"
    local color13 = vim.g.color13 or "#ffffff"
    local color12 = vim.g.color12 or "#ffffff"
    local color11 = vim.g.color11 or "#ffffff"
    local color10 = vim.g.color10 or "#ffffff"
    local color9 = vim.g.color9 or "#ffffff"
    local color8 = vim.g.color8 or "#ffffff"
    local color7 = vim.g.color7 or "#ffffff"
    local color6 = vim.g.color6 or "#ffffff"
    local color5 = vim.g.color5 or "#ffffff"
    local color4 = vim.g.color4 or "#ffffff"
    local color3 = vim.g.color3 or "#ffffff"
    local color2 = vim.g.color2 or "#ffffff"
    local color1 = vim.g.color1 or "#ffffff"

    -- helper function for utf8 chars
    local function getCharLen(s, pos)
      local byte = string.byte(s, pos)
      if not byte then
        return nil
      end
      return (byte < 0x80 and 1) or (byte < 0xE0 and 2) or (byte < 0xF0 and 3) or (byte < 0xF8 and 4) or 1
    end

    local function applyColors(logo, colors, logoColors)
      dashboard.section.header.val = logo

      for key, color in pairs(colors) do
        local name = "Alpha" .. key
        vim.api.nvim_set_hl(0, name, color)
        colors[key] = name
      end

      dashboard.section.header.opts.hl = {}
      for i, line in ipairs(logoColors) do
        local highlights = {}
        local pos = 0

        for j = 1, #line do
          local opos = pos
          pos = pos + getCharLen(logo[i], opos + 1)

          local color_name = colors[line:sub(j, j)]
          if color_name then
            table.insert(highlights, { color_name, opos, pos })
          end
        end
        dashboard.section.header.opts.hl[i] = highlights
      end
      return dashboard.opts
    end

    require("alpha").setup(applyColors({
      [[                                                                   ]],
      [[      ████ ██████           █████      ██                    ]],
      [[     ███████████             █████                            ]],
      [[     █████████ ███████████████████ ███   ███████████  ]],
      [[    █████████  ███    █████████████ █████ ██████████████  ]],
      [[   █████████ ██████████ █████████ █████ █████ ████ █████  ]],
      [[ ███████████ ███    ███ █████████ █████ █████ ████ █████ ]],
      [[██████  █████████████████████ ████ █████ █████ ████ ██████]],
    }, {
      ["a"] = { fg = color1, ctermfg = 33 },
      ["b"] = { fg = color2, ctermfg = 33 },
      ["c"] = { fg = color3, ctermfg = 33 },
      ["d"] = { fg = color4, ctermfg = 33 },
      ["e"] = { fg = color5, ctermfg = 33 },
      ["f"] = { fg = color6, ctermfg = 33 },
      ["g"] = { fg = color7, ctermfg = 33 },
      ["h"] = { fg = color8, ctermfg = 33 },
      ["i"] = { fg = color9, ctermfg = 33 },
      ["j"] = { fg = color10, ctermfg = 33 },
      ["k"] = { fg = color11, ctermfg = 33 },
      ["l"] = { fg = color12, ctermfg = 33 },
      ["m"] = { fg = color13, ctermfg = 33 },
      ["n"] = { fg = color14, ctermfg = 33 },
      ["o"] = { fg = color15, ctermfg = 33 },
      ["p"] = { fg = color16, ctermfg = 33 },
    }, {
      [[                                             cc                      ]],
      [[      iiiiiiiiiiiiiii         iiiiiiiii      cccc                    ]],
      [[     jjjjjjjjjjjjjjj            jjjjjjjjjjjj                         ]],
      [[     bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb  ]],
      [[    ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd  ]],
      [[   llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll  ]],
      [[kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk ]],
      [[nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn]],
    }))
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "󰱼  > Find file", ":lua Snacks.picker.files()<CR>"),
      dashboard.button("p", "󰥨  > Find projects", ":lua Snacks.picker.projects()<CR>"),
      dashboard.button("r", "  > Recent", ":lua Snacks.picker.recent()<CR>"),
      dashboard.button("c", "  > Config", ":lua Snacks.picker.files({cwd = vim.fn.stdpath('config')})<CR>"),
      dashboard.button("l", "󰒲 > Lazy", ":Lazy<CR>"),
      dashboard.button("h", "  > Settings", ":lua Snacks.picker.files({cwd = vim.fn.expand(~/.config/hypr)})<CR>"),
      dashboard.button("q", "  > Quit", ":qa<CR>"),
    }
    dashboard.section.footer.val = { "", "Welcome!" }
  end,
}

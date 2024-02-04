#!/usr/local/bin/fish
# Feature: use fish shell to auto install or upgrade languages's servers formatters and linters.

# all formulas of
set servers lua-language-server
set formatters stylua
set linters luacheck

# check formula and update it
# $1 is array $2 is need update
function check_update
  set result (brew info $argv[1])
  echo $result
end

# handle formulas
# $1 formulas
function handle_formulas
  for item in $argv[1]
    check_update $item
  end
end

handle_formulas $servers
handle_formulas $formatters
handle_formulas $linters

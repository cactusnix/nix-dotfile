# The shell script is only can be used at macOS.

set langs_path "./lua/langs"

function brew_check
  echo "Check hombrew..."
  if type brew -q
    return 0
  else
    echo "Homebrew is not installed, please install it first"
    return 1
  end
end

function brew_packages
  if brew_check
    if test $(count $argv) -gt 0
      set packages $(brew list)
      for package in $argv
        if contains $package $packages
          echo "🎉"$package "has been installed."
        else
          echo "Execute: brew install" $package
          if brew install $package
            echo "🎉"$package "has been successfully installed."
          else
            echo "⚠️Command execute failed." $package
            exit 1
          end
        end
      end
    else
      echo "Missing brew packages."
      exit 1
    end
  else
    exit 1
  end
end

function servers
  set servers_path $langs_path/servers
  set brew_packages
  for file in $servers_path/*
    set meta $(lua $file)
    if test "brew" = $meta[1]
      set -a brew_packages $meta[2]
    end
  end
  if test $(count $brew_packages) -gt 0
    brew_packages $brew_packages
  end
end

# Some packages cannot be installed by some formula, so install it manually.
function others
end

servers

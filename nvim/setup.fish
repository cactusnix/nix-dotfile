# The shell script is only can be used at macOS.

set langs_path "./lua/langs"
set special_packages rustfmt

function brew_check
  echo "Check hombrew..."
  if type brew -q
    return 0
  else
    echo "Homebrew is not installed, please install it first"
    return 1
  end
end

function rustup_check
  echo "Check rustup..."
  if type rustup -q
    return 0
  else
    echo "Please install rustup with homebrew."
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
          # if brew install $package
          #   echo "🎉"$package "has been successfully installed."
          # else
          #   echo "⚠️Command execute failed." $package
          #   exit 1
          # end
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

function langs
  if test -n $argv
    echo "Installing language" $argv "..."
    set packages_path $langs_path/$argv
    set brew_packages
    set other_packages
    for file in $packages_path/*
      set filename $(basename $file)
      set name $(string replace ".lua" "" $filename)
      # Default package install is homebrew
      if test -n $name
        if contains $name $spacial_packages
          set -a other_packages $name
        else
          set -a brew_packages $name
        end
      end
    end
    if test $(count $brew_packages) -gt 0
      brew_packages $brew_packages
    end
    if test $(count $other_packages) -gt 0
      other_packages $other_packages
    end
    echo "Language" $argv "is setup."
  end
end

# Some packages cannot be installed by some formula, so install it manually.
function other_packages
  echo $argv "is special"
end

langs servers
langs formatters
langs linters

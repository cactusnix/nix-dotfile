# This shell is just for macOS.

function check_homebrew
  echo "Check hombrew..."
  if type brew -q
    return 0
  else
    echo "Homebrew is not installed, please install it first"
    return 1
  end
end

function setup
  echo "WezTerm setup start..."
  if check_homebrew
    set success "WezTerm setup has been ready for use, just enjoy it." 
    set font font-fira-mono
    set packages $(brew list)
    if contains $font $packages
      echo "Font that font-fira-mono has been installed."
      echo $success
    else 
      echo "Execute: brew install font-fira-mono"
      if brew install font-fira-mono
        echo $success
      else 
        echo "Font that font-fira-mono is not successfully installed "
      end
    end
  end
end

setup

# Upgrade Packages and Updates Package Panager
function uu
    sudo apt update -y
    sudo apt full-upgrade -y
    brew upgrade
    ya pack -u
    fisher update
end

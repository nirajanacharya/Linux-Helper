

display_menu() {
    echo "Welcome to the Student Linux Helper Script"
    echo "1. Update System"
    echo "2. Install Software Packages"
    echo "3. Check Disk Space"
    echo "4. Restart Network Service"
    echo "5. Check System Information"
    echo "6. Exit"
}


update_system() {
    sudo apt update && sudo apt upgrade -y
}


install_packages() {
    echo "Enter the name of the package(s) to install (separated by space):"
    read -r packages
    sudo apt install $packages -y
}

check_disk_space() {
    df -h
}


restart_network_service() {
    sudo systemctl restart network-manager
    echo "Network service restarted successfully."
}


system_info() {
    uname -a
    lsb_release -a
}


while true; do
    display_menu
    echo "Enter your choice:"
    read -r choice
    case $choice in
        1) update_system ;;
        2) install_packages ;;
        3) check_disk_space ;;
        4) restart_network_service ;;
        5) system_info ;;
        6) echo "Exiting..."; exit ;;
        *) echo "Invalid option. Please try again." ;;
    esac
done

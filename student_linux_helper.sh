#!/bin/bash
# Script developed by Niranjan Acharya
# Email: nirajan.acharya666@gmail.com
# GitHub: https://github.com/NirajanAcharya666

display_menu() {
    clear
    echo "  ╔══════════════════════════════════════╗"
    echo "  ║        Linux Helper      ║"
    echo "  ╠══════════════════════════════════════╣"
    echo "  ║ 1.  Update System                     ║"
    echo "  ║ 2.  Install Software Packages         ║"
    echo "  ║ 3.  Install VLC Media Player          ║"
    echo "  ║ 4.  Install Visual Studio Code        ║"
    echo "  ║ 5.  Check Disk Space                  ║"
    echo "  ║ 6.  Restart Network Service           ║"
    echo "  ║ 7.  Check System Information          ║"
    echo "  ║ 8.  Display Hardware Information      ║" # New option
    echo "  ║ 9.  List Running Processes            ║"
    echo "  ║ 10. View System Logs                  ║"
    echo "  ║ 11. Manage Users                      ║"
    echo "  ║ 12. Backup Data                       ║"
    echo "  ║ 13. Monitor System Performance        ║"
    echo "  ║ 14. Configure Firewall                ║"
    echo "  ║ 15. Manage Services                   ║"
    echo "  ║ 16. Search for Files                  ║"
    echo "  ║ 17. Modify File Permissions           ║"
    echo "  ║ 18. Exit                              ║"
    echo "  ╚══════════════════════════════════════╝"

    echo "  ║                 Version 1.0.0                ║"
    echo "  ║                 Developed by Nirajan Acharya ║"
}
send_notification() {
    title="$1"
    message="$2"
    notify-send "$title" "$message"
}

update_system() {
    send_notification "Update System" "Updating system..."
    sudo apt update && sudo apt upgrade -y
    send_notification "Update System" "System update completed."
}

install_packages() {
    echo "Enter the name of the package(s) to install (separated by space):"
    read -r packages
    sudo apt install $packages -y
}

install_vlc() {
    sudo apt install vlc -y
}

install_vscode() {
    sudo snap install code --classic
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

display_hardware_info() {
    echo "CPU Information:"
    lscpu | grep -E '(Model name|Socket|Thread|Core|CPU MHz)'

    echo -e "\nMemory Information:"
    free -h

    echo -e "\nDisk Information:"
    df -h
}

list_processes() {
    ps aux
}

view_system_logs() {
    tail -n 20 /var/log/syslog
}

manage_users() {
    echo "1. Add a new user"
    echo "2. Change user password"
    echo "3. Delete a user"
    read -p "Enter your choice: " user_choice

    case $user_choice in
        1) sudo adduser ;;
        2) sudo passwd ;;
        3) sudo deluser ;;
        *) echo "Invalid option. Please try again." ;;
    esac
}

backup_data() {
    echo "Enter the directory to backup:"
    read -r directory
    echo "Enter the destination for backup:"
    read -r destination
    sudo tar czvf $destination/backup_$(date +"%Y%m%d").tar.gz $directory
}

monitor_performance() {
    top
}

configure_firewall() {
    sudo ufw status
    echo "1. Enable Firewall"
    echo "2. Disable Firewall"
    read -p "Enter your choice: " fw_choice

    case $fw_choice in
        1) sudo ufw enable ;;
        2) sudo ufw disable ;;
        *) echo "Invalid option. Please try again." ;;
    esac
}

manage_services() {
    echo "1. Start a service"
    echo "2. Stop a service"
    echo "3. Restart a service"
    read -p "Enter your choice: " service_choice

    echo "Enter the service name:"
    read -r service_name

    case $service_choice in
        1) sudo systemctl start $service_name ;;
        2) sudo systemctl stop $service_name ;;
        3) sudo systemctl restart $service_name ;;
        *) echo "Invalid option. Please try again." ;;
    esac
}

search_files() {
    echo "Enter the file name to search:"
    read -r file_name
    sudo find / -name "$file_name"
}

modify_permissions() {
    echo "Enter the file or directory path:"
    read -r file_path
    echo "Enter the new permissions (in octal format):"
    read -r permissions
    sudo chmod $permissions $file_path
}

while true; do
    display_menu
    echo "Enter your choice:"
    read -r choice
    case $choice in
        1) update_system ;;
        2) install_packages ;;
        3) install_vlc ;;
        4) install_vscode ;;
        5) check_disk_space ;;
        6) restart_network_service ;;
        7) system_info ;;
        8) display_hardware_info ;;
        9) list_processes ;;
        10) view_system_logs ;;
        11) manage_users ;;
        12) backup_data ;;
        13) monitor_performance ;;
        14) configure_firewall ;;
        15) manage_services ;;
        16) search_files ;;
        17) modify_permissions ;;
        18) echo "Exiting..."; exit ;;
        *) echo "Invalid option. Please try again." ;;
    esac
    read -p "Press Enter to continue..."
done
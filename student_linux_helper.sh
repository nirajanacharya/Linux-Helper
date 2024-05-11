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
    echo "  ║ 8.  List Running Processes            ║"
    echo "  ║ 9.  View System Logs                  ║"
    echo "  ║ 10. Manage Users                      ║"
    echo "  ║ 11. Backup Data                       ║"
    echo "  ║ 12. Monitor System Performance        ║"
    echo "  ║ 13. Configure Firewall                ║"
    echo "  ║ 14. Manage Services                   ║"
    echo "  ║ 15. Search for Files                  ║"
    echo "  ║ 16. Modify File Permissions           ║"
    echo "  ║ 17. Exit                              ║"
    echo "  ║                 Developed by Nirajan Acharya ║"
    echo "  ╚══════════════════════════════════════╝"
}

update_system() {
    sudo apt update && sudo apt upgrade -y
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
        8) list_processes ;;
        9) view_system_logs ;;
        10) manage_users ;;
        11) backup_data ;;
        12) monitor_performance ;;
        13) configure_firewall ;;
        14) manage_services ;;
        15) search_files ;;
        16) modify_permissions ;;
        17) echo "Exiting..."; exit ;;
        *) echo "Invalid option. Please try again." ;;
    esac
    read -p "Press Enter to continue..."
done

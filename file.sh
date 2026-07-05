wget https://bin.ngrok.com/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz > /dev/null 2>&1
tar -xf ngrok-v3-stable-linux-amd64.tgz > /dev/null 2>&1
chmod +x ./ngrok
read -p "Paste authtoken here (Copy and Ctrl+V to paste then press Enter): " CRP
./ngrok authtoken $CRP 
nohup ./ngrok tcp 5900 &>/dev/null &
echo Please wait for installing new 10...
sudo apt update -y > /dev/null 2>&1
echo "Installing QEMU (2-3m)..."
sudo apt install qemu-system-x86 curl -y > /dev/null 2>&1
echo Downloading Windows Disk...
curl -o win11.iso https://software.download.prss.microsoft.com/dbazure/Windows11_InsiderPreview_EnterpriseVL_x64_en-gb_28020_2366.iso?t=4b9fc489-98d3-4ca5-9461-d498207caed3&P1=1783369931&P2=602&P3=2&P4=am3nNkHP9lEBmRw1JdzrWaZ7KFTpxAsir7lRV0gqYl5f7uvuN1B9f2W7rwaWFfZ22v7BQE9V%2b6APG%2fBFbWboTZXOyCJnmNEVYZZkNovrWhOgVLzUhHcF%2fKp10uvSOWOYjQ5owRvPzZkGPlQuNjzr3xAxVgZwd84Ab1u%2fxYVDww%2fzKr45EDv09m4eZg%2bFNWV9fiHe46%2bhradqnMpmwK9VFmmz1xpwi8IaZSXd%2f9U9REPWI2aYB0St%2fbIcDwYFMxWMAaCPUkl%2bqAQF9XEKrCuTPiXd0REWt9Eq%2bG6Qld1eiDeH4QNhGDvc%2boNn5GwuqG0C28AsxeMjXSuE0EgFQLAnTA%3d%3d
echo "Windows 10 x64 Lite On Google Colab"
echo Your VNC IP Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "Note: Use Right-Click Or Ctrl+C To Copy"
echo "Please Keep Colab Tab Open, Maximum Time 12h"
echo Script by fb.com/thuong.hai.581
echo Starting Windows xxxz...
qemu-img create -f qcow2 my_disk.qcow2 1024G
sudo qemu-system-x86_64 -vnc :0 -hda my_disk.qcow2 -cdrom win11.iso  -smp cores=2 -m 8096M -machine usb=on -device usb-tablet

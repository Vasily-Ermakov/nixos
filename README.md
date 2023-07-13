# Virtualization via Oracle VM VirtualBox CLI
- Create VM:

      VBoxManage createvm --name NixOS --ostype Linux_64 --register
      VBoxManage modifyvm NixOS --memory 8192 --cpus 2 --firmware efi
- Add storage controller:

      VBoxManage storagectl NixOS --name IDE --add ide
- Create HDD:

      VBoxManage createmedium disk --filename "{hdd-path}\hdd.iso" --size 20480
- Attach HDD to storage controller:

      VBoxManage storageattach NixOS --storagectl IDE --port 0 --device 0 --type hdd --medium "{hdd-path}\hdd.iso"
- Attach NixOS minimal ISO to storage controller:

      VBoxManage storageattach NixOS --storagectl IDE --port 1 --device 0 --type dvddrive --medium "{nixos-iso-path}\{nixos-iso-name}"

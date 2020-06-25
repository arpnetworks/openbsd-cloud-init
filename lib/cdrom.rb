class CdRom
  def initialize(device)
    @dev = device
    @mountpoint = "/mnt"

    raise InvalidCdRom if @dev.nil?
    raise InvalidCdRom if @dev !~ %r{^/dev/cd[0-9]+$}
  end

  def mount!
    Kernel.system("mount", @dev, @mountpoint)
  end

  def umount!
    Kernel.system("umount", @mountpoint)
  end
end

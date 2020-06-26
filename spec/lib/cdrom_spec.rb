require File.dirname(__FILE__) + '/../../lib/cdrom'
require File.dirname(__FILE__) + '/../../lib/exceptions/invalid_cdrom'

RSpec.describe CdRom do
  def do_initialize
    CdRom.new(@device)
  end

  describe 'initialize()' do
    context 'with device' do
      context 'that is malformed' do
        before do
          @device = '/tmp/foo'
        end

        it 'should raise error' do
          expect { do_initialize }.to raise_error(InvalidCdRom)
        end
      end

      context 'that is valid' do
        before do
          @device = '/dev/cd0'
        end

        it 'should not raise error' do
          expect { do_initialize }.not_to raise_error
        end
      end
    end

    context 'without device' do
      before do
        @device = nil
      end

      it 'should raise error' do
        expect { do_initialize }.to raise_error(InvalidCdRom)
      end
    end
  end

  context 'with cdrom object' do
    before do
      @device = '/dev/cd0'
      @cdrom = CdRom.new(@device)
    end

    describe 'mount!()' do
      def do_mount
        @cdrom.mount!
      end

      it 'should execute mount of CD-ROM on /mnt' do
        expect(Kernel).to receive(:system).with('mount', @device, '/mnt')
        do_mount
      end
    end

    describe 'umount!()' do
      def do_umount
        @cdrom.umount!
      end

      it 'should execute mount of CD-ROM' do
        expect(Kernel).to receive(:system).with('umount', '/mnt')
        do_umount
      end
    end
  end
end

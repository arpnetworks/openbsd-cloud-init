require 'yaml'

require File.dirname(__FILE__) + '/../../lib/user_data'
require File.dirname(__FILE__) + '/../../lib/exceptions/invalid_user_data'

RSpec.describe UserData do
  before do
    @SAMPLE_USER_DATA_FILE = File.dirname(__FILE__) + \
      '/../config-disk/sample/user-data'
  end

  def do_initialize
    @user_data = UserData.new(@user_data_file)
  end

  describe 'initialize()' do
    context 'with user data file' do
      before do
        @user_data_file = @SAMPLE_USER_DATA_FILE
        allow(File).to receive(:exist?).and_return true
      end

      it 'should not raise error' do
        expect { do_initialize }.not_to raise_error
      end

      describe 'users()' do
        context 'with valid instance using our sample data' do
          before do
            @user_data = do_initialize
          end

          it 'should return array of two users' do
            expect(@user_data.users).to be_instance_of(Array)
            expect(@user_data.users.size).to eq 2
          end
        end
      end
    end

    context 'without user data file' do
      before do
        @user_data_file = 'non-existent.yaml'
        allow(File).to receive(:exist?).and_return false
      end

      it 'should raise error' do
        expect { do_initialize }.to raise_error(InvalidUserData)
      end
    end
  end
end

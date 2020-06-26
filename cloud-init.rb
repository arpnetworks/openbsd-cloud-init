require 'yaml'

$BASE=File.expand_path(File.dirname(__FILE__)) + '/'
$LIB=$BASE + "lib/"

# Load the secret sauce
# ---------------------
require $LIB + 'cdrom'
require $LIB + 'user_data'
require $LIB + 'config_disk'

# Load exceptions
# ---------------
require $LIB + 'exceptions/invalid_cdrom'
require $LIB + 'exceptions/invalid_user_data'

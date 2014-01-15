# Load boxen environment. Note that this slows down the terminal load considerably.
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

# Load GVM environment
[ -f /Users/rb/.gvm/bin/gvm-init.sh ] && source /Users/rb/.gvm/bin/gvm-init.sh
export PATH=~/bin/:$PATH
export PATH=~/pebble-dev/PebbleSDK-2.0-BETA5/bin:$PATH
SONAR_RUNNER_HOME=/opt/boxen/homebrew/Cellar/sonar-runner/2.3/libexec
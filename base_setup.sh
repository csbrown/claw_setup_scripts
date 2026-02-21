# =============================================
# OpenClaw Setup Script for Fresh Linux Install
# =============================================
# NOTE:
#   OpenClaw requires the ANTHROPIC_API_KEY environment variable.
#   Add the export line below to your ~/.bashrc for persistence.
#
# export ANTHROPIC_API_KEY="<YOUR_API_KEY>"
#
# Remove the comment symbol (#) above and insert your API key before running.
# =============================================

# 1. Update system packages
sudo apt update
sudo apt install -y python3 python3-pip python3-venv git curl build-essential

# 2. Create project directory and Python virtual environment
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip

# 3. Install OpenClaw
pip install git+https://github.com/openclaw/openclaw.git
openclaw --version

# 4. Configure Anthropic provider (requires ANTHROPIC_API_KEY to be set)
openclaw providers add anthropic --api-key "$ANTHROPIC_API_KEY"
openclaw providers default anthropic
openclaw providers list

# 5. Install filesystem and shell skills
openclaw skills install filesystem
openclaw skills install shell
openclaw skills list

# 6. Initialize OpenClaw workspace
openclaw init myworkspace
cd myworkspace

# 7. Launch interactive chat
# Example prompt once inside chat:
#   "Hello Claude. Can you confirm that OpenClaw is working?"
# Exit with /exit
#openclaw chat

# 8. Test file creation skills
# Example objective inside `openclaw run`:
#   Create a file named test_output.txt in the current directory containing the text
#   "This file was created by OpenClaw."
#openclaw run

# 9. Additional multi-step example objective for `openclaw run`:
#   Create a folder called reports, generate a text file inside it summarizing
#   three facts about black holes, and list the directory contents.

# 10. Useful reference commands
#   openclaw run
#   openclaw chat
#   openclaw skills search
#   openclaw skills install <name>

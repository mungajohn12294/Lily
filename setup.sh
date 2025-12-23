#!/data/data/com.termux/files/usr/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "${YELLOW}🚀 Lilian Surprise - GitHub Pages Setup${NC}"
echo "======================================"

# Get project name
read -p "Enter project name (default: lilian-surprise): " project_name
project_name=${project_name:-lilian-surprise}

# Get GitHub username
read -p "Enter your GitHub username: " github_username
read -p "Enter your GitHub email: " github_email

echo "\n${GREEN}📦 Step 1: Creating project structure...${NC}"
mkdir -p ~/$project_name
cd ~/$project_name

echo "\n${GREEN}📝 Step 2: Creating HTML file...${NC}"
cat > index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For Lilian 💖</title>
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
        }
        h1 {
            font-size: 3em;
            margin-bottom: 20px;
        }
        .heart {
            font-size: 100px;
            animation: heartbeat 1.5s infinite;
        }
        @keyframes heartbeat {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.1); }
        }
    </style>
</head>
<body>
    <div class="heart">💖</div>
    <h1>For My Lilian</h1>
    <p>This is a special surprise just for you!</p>
    <p>Made with love 💕</p>
</body>
</html>
EOF

echo "\n${GREEN}🔧 Step 3: Initializing Git...${NC}"
git init
git config user.name "$github_username"
git config user.email "$github_email"

echo "\n${GREEN}📁 Step 4: Creating necessary files...${NC}"
touch .nojekyll
echo "# Lilian's Surprise Website 💖" > README.md
echo "A special website created with love" >> README.md

echo "\n${GREEN}📤 Step 5: Committing files...${NC}"
git add .
git commit -m "Initial commit - Surprise for Lilian 💖"

echo "\n${YELLOW}🔗 Step 6: Setting up GitHub remote...${NC}"
echo "${YELLOW}Please create a repository at:${NC}"
echo "${GREEN}https://github.com/new${NC}"
echo "${YELLOW}Repository name:${NC} $project_name"
echo "${YELLOW}Then come back and press Enter...${NC}"
read -p ""

# Add remote
git remote add origin https://github.com/$github_username/$project_name.git

echo "\n${YELLOW}🔐 Step 7: GitHub Authentication${NC}"
echo "${YELLOW}You need to create a Personal Access Token:${NC}"
echo "1. Go to: ${GREEN}https://github.com/settings/tokens${NC}"
echo "2. Click 'Generate new token'"
echo "3. Select 'repo' scope"
echo "4. Copy the token and paste it below when asked for password"
echo ""

# Push to GitHub
git branch -M main
git push -u origin main

echo "\n${GREEN}✅ Setup complete!${NC}"
echo "\n${YELLOW}🌐 Your website will be available at:${NC}"
echo "${GREEN}https://$github_username.github.io/$project_name${NC}"
echo "\n${YELLOW}To update your site, just run:${NC}"
echo "cd ~/$project_name"
echo "./deploy.sh"

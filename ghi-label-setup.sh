# Get target repo and authentication.
read -e -p "Enter repo as owner/repo: " REPO
read -e -p "Enter user: " USER
read -e -p "Enter pass (token needed for 2-factor-auth): " PASS

TARGET="https://api.github.com/repos/$REPO/labels"

# Check repo exists.
RESPONSE=$(curl --user "$USER:$PASS" --include --request GET --write-out %{http_code} --silent --output /dev/null $TARGET)
if [[ $RESPONSE != "200" ]]
then
    echo "Response was $RESPONSE"
    exit 1
else
    read -e -p "Confirm adding labels to $TARGET: " CONFIRM
fi

if [[ $CONFIRM != "y" ]]
then
    echo "Aborting"
    exit 1
fi

curl --user "$USER:$PASS" --include --request POST --data '{"name": "front-end", "color": "bfe5bf"}' $TARGET
curl --user "$USER:$PASS" --include --request POST --data '{"name": "functionality", "color": "5319e7"}' $TARGET
curl --user "$USER:$PASS" --include --request POST --data '{"name": "styles", "color": "009800"}' $TARGET
curl --user "$USER:$PASS" --include --request POST --data '{"name": "information", "color": "444444"}' $TARGET
curl --user "$USER:$PASS" --include --request POST --data '{"name": "awaiting info", "color": "d7e102"}' $TARGET
curl --user "$USER:$PASS" --include --request POST --data '{"name": "content", "color": "207de5"}' $TARGET
curl --user "$USER:$PASS" --include --request POST --data '{"name": "blocked", "color": "f7c6c7"}' $TARGET
curl --user "$USER:$PASS" --include --request POST --data '{"name": "accounts", "color": "d4c5f9"}' $TARGET
curl --user "$USER:$PASS" --include --request POST --data '{"name": "freelancer", "color": "fbca04"}' $TARGET

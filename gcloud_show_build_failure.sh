id="$1"
if [ -z "$id" ]; then
  echo "Requires gcloud build id"
  exit 1
fi

finder="ag -Q"
which ag >/dev/null || finder="grep"

errcho() {
  >&2 echo $@
}

set -e

LOGS_DIR="$HOME/.gcloud/logs"
LOG_FILE="$LOGS_DIR/$id"
FAILURE_FILE="$LOGS_DIR/$id-failure"

if [ -f "$FAILURE_FILE" ]; then
  less $FAILURE_FILE
  exit 0
fi

errcho "Cleaning old logs..."
rm -r $LOGS_DIR
mkdir -p $LOGS_DIR

errcho 'Downloading build...'
step_id=$(gcloud builds describe "$id" --format=json | node -e "var data = ''; process.openStdin().on('data', function(chunk) { data += chunk }).on('end', function() { console.log(JSON.parse(data).steps.find(s=>s.status==='FAILURE').id); });")
errcho "Failed step: $step_id"

errcho 'Downloading logs...'
gcloud builds log "$id" > $LOG_FILE

errcho 'Filtering for failed step...'
$finder "$step_id" < $LOG_FILE | tee $FAILURE_FILE | less

errcho "Logs saved to $LOG_FILE"
errcho "Failure saved to $FAILURE_FILE"

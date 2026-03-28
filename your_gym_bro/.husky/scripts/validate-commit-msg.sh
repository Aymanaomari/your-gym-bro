#!/usr/bin/env sh

commit_msg_file="$1"

if [ -z "$commit_msg_file" ] || [ ! -f "$commit_msg_file" ]; then
  echo "❌ Commit message file not found."
  exit 1
fi

message=$(cat "$commit_msg_file")

pattern='^(feat|chore|refacto|performace|performance|bugfix|fix|sec): \[YGB-[0-9]+\] - .+$'

if echo "$message" | grep -Eq "$pattern"; then
  exit 0
fi

echo "❌ Invalid commit message format."
echo "Expected: (feat|refacto|chore|performace|performance|bugfix|fix|sec): [YGB-x] - Description"
echo "Example: feat: [YGB-3] - Add login validation tests"
exit 1

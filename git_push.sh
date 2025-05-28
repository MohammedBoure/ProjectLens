#!/bin/bash

# 1. Add all files
git add .

# 2. Unstage the commit_msg file (إذا الملف موجود في الـ staging)
git reset commit_msg

# 3. Remove all __pycache__ directories from staging (لكن لا تحذف الملفات فعليًا)
find . -type d -name "__pycache__" -exec git rm -r --cached {} +

# 4. Append content of commit_msg to commit_msgs
cat commit_msg >> commit_msgs

# 5. Commit using the content of commit_msg file
git commit -F commit_msg

# 6. Get current branch name dynamically
current_branch=$(git symbolic-ref --short HEAD)

# 7. Push to the current branch (تجنب مشكلة عدم تطابق اسم الفرع)
git push origin "$current_branch"

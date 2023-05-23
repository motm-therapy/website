#!/usr/bin/env bash


timestamp="$CI_COMMIT_TIMESTAMP"
if [[ "${timestamp}" == "" ]]; then timestamp="$(date --iso-8601=seconds)"; fi

# This string replaces the "copyright:" line in the config file at website build time
copyright_string="copyright: \"Copyright &copy; 2023 Matters of the Mind Therapy, LLC<br>Last Site Update: ${timestamp}\""

echo "[INFO] Replacing previous copyright line in mkdocs.yml with:"
echo "       ${copyright_string}"
while IFS=$'\n' read -r line; do
  if [[ "${line}" =~ ^copyright: ]]; then
    config_lines+=( "${copyright_string}" )
  else
    config_lines+=( "${line}" )
  fi
done < ./mkdocs.yml
: > ./mkdocs.yml
for config_line in "${config_lines[@]}"; do
  echo "${config_line}" >> ./mkdocs.yml
done

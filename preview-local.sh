#!/usr/bin/env sh

main() {

  local operation
  
  operation="${1}"

  case "$operation" in
  serve)
    docker run \
      --rm \
      -d \
      -p 8000:8000 \
      -v "${PWD}:/docs" \
      --name "motm_therapy_local_preview" \
      squidfunk/mkdocs-material || \
    { echo -e "\n[FAIL] Failed to serve local preview copy of site." 1>&2; return 1; }
    echo -e "\n[INFO] Local preview copy of site successfuly served."; return 0;
  ;;
  build)
    docker run \
      --rm \
      -it \
      --entrypoint "" \
      -v "${PWD}:/docs" \
      squidfunk/mkdocs-material \
      mkdocs build --strict --verbose --site-dir public || \
    { echo -e "\n[FAIL] Failed to build local preview copy of site." 1>&2; return 1; }
    echo -e "\n[INFO] Local preview copy of site successfuly built."; return 0;
  ;;
  kill)
    docker kill "motm_therapy_local_preview" || \
    { echo -e "\n[FAIL] Failed to kill container hosting local preview copy of site." 1>&2; return 1; }
    echo -e "\n[INFO] Local preview copy of site successfuly killed."; return 0;
  ;;
  *)
    echo -e "\n[FAIL] Please specify either a 'kill', 'serve', or 'build' operation/subcommand to this script; exiting." 1>&2
  ;;
  esac

} 

main "$@" || exit 1

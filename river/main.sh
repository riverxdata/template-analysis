#!/bin/bash
# Add this to allow load the variables form config json
while IFS== read key value; do
    printf -v "$key" "$value"
done < <(jq -r 'to_entries|map("\(.key)=\(.value|tostring)")|.[]' config.json)


echo ""
echo "============================================="
echo "          RIVER ANALYSIS TEMPLATE"
echo "============================================="
echo ""

# Default Environment Variables
echo ">> Default Environment Variables:"
echo "---------------------------------------------"
echo "UUID Job ID  : $uuid_job_id"
echo "CPUs         : $cpus"
echo "Memory       : $memory"
echo "Times        : $times"
echo "RIVER_HOME   : $RIVER_HOME"
echo "---------------------------------------------"
echo ""

# Parameters
echo ">> Parameters:"
echo "---------------------------------------------"
echo "File Path    : $file"
echo "Folder Path  : $dir"
echo "Integer      : $integer"
echo "Number(float): $number"
echo "String       : $string"
echo "Boolean      : $boolean"
echo "---------------------------------------------"
echo ""

# Bootstrap (for Custom Reverse Proxy)
echo ">> Bootstrap: Uncomment if you want to use custom reverse proxy"
echo "---------------------------------------------"
# Custom reverse location.
# Example: RStudio Server automatically redirects to `/` and restricts iframe usage.
echo "$uuid_job_id/" > "$RIVER_HOME/.river/jobs/$uuid_job_id/job.proxy_location"

# Example: VS Code Server or JupyterLab requires reverse proxy.
echo "$uuid_job_id" > "$RIVER_HOME/.river/jobs/$uuid_job_id/job.url"

# If the job is only exported via port (basic web app), still create this file but leave it empty.
touch "$RIVER_HOME/.river/jobs/$uuid_job_id/job.url"
echo "---------------------------------------------"
echo ""

# Placeholder for Main Script Execution
echo "Put your main script here, using arguments from environment variables."

echo ""
echo "✔ Analysis Completed!"
echo "============================================="

set -e

memory_mb=""

if [ -r /proc/meminfo ]; then
  memory_mb=$(awk '/MemTotal/{print int($2 / 1024)}' /proc/meminfo)
elif command -v sysctl >/dev/null 2>&1; then
  # macOS: hw.memsize is bytes
  memory_mb=$(sysctl -n hw.memsize 2>/dev/null | awk '{print int($1 / 1024 / 1024)}')
fi

if [ -z "$memory_mb" ] || [ "$memory_mb" -le 0 ]; then
  # Fallback: do not override NODE_OPTIONS if we cannot detect memory.
  exit 0
fi

max_old_space_size=$((memory_mb - 1024))
if [ "$max_old_space_size" -le 0 ]; then
  max_old_space_size=1024
fi

node_options="--max-old-space-size=$max_old_space_size"
echo "NODE_OPTIONS=$node_options"
export NODE_OPTIONS="$node_options"

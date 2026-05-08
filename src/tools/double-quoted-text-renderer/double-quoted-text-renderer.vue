<script setup lang="ts">
import TextareaCopyable from '@/components/TextareaCopyable.vue';
import { withDefaultOnError } from '@/utils/defaults';

const { t } = useI18n();

const quotedInput = ref('"Hello\\nWorld"');

const renderedOutput = computed(() => withDefaultOnError(() => {
  const trimmed = quotedInput.value.trim();
  if (!trimmed) {
    return '';
  }
  if (!trimmed.startsWith('"') || !trimmed.endsWith('"')) {
    throw new Error('invalid');
  }
  return JSON.parse(trimmed);
}, t('tools.double-quoted-text-renderer.error-invalid')));
</script>

<template>
  <c-card :title="t('tools.double-quoted-text-renderer.title')">
    <c-input-text
      v-model:value="quotedInput"
      :label="t('tools.double-quoted-text-renderer.input-label')"
      :placeholder="t('tools.double-quoted-text-renderer.input-placeholder')"
      raw-text
      multiline
      rows="4"
      mb-2
    />

    <n-divider />

    <TextareaCopyable
      :label="t('tools.double-quoted-text-renderer.output-label')"
      :value="renderedOutput"
      multiline
      readonly
      rows="5"
    />
  </c-card>
</template>

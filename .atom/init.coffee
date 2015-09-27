# Yank til end of line
atom.commands.add 'atom-text-editor',
  'custom:yank-to-end-of-line': ->
    editor = atom.workspace.getActiveTextEditor()
    position = editor.getCursorBufferPosition()
    editor.selectToEndOfLine()
    editor.copySelectedText()
    editor.setCursorScreenPosition(position)

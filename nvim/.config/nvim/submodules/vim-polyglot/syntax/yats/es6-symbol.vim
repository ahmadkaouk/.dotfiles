if has_key(g:polyglot_is_disabled, 'typescript')
  finish
endif

syntax keyword typescriptGlobal containedin=typescriptIdentifierName Symbol nextgroup=typescriptGlobalSymbolDot,typescriptFuncCallArg
syntax match   typescriptGlobalSymbolDot /\./ contained nextgroup=typescriptSymbolStaticProp,typescriptSymbolStaticMethod,typescriptProp
syntax keyword typescriptSymbolStaticProp contained length iterator match replace
syntax keyword typescriptSymbolStaticProp contained search split hasInstance isConcatSpreadable
syntax keyword typescriptSymbolStaticProp contained unscopables species toPrimitive
syntax keyword typescriptSymbolStaticProp contained toStringTag
if exists("did_typescript_hilink") | HiLink typescriptSymbolStaticProp Keyword
endif
syntax keyword typescriptSymbolStaticMethod contained for keyFor nextgroup=typescriptFuncCallArg
if exists("did_typescript_hilink") | HiLink typescriptSymbolStaticMethod Keyword
endif
{-# LANGUAGE TemplateHaskell #-}
module TreeSitter.Verilog
( tree_sitter_verilog
, Grammar(..)
) where

import Language.Haskell.TH
import TreeSitter.Verilog.Internal
import TreeSitter.Language

-- Regenerate template haskell code when these files change:
addDependentFileRelative "../vendor/tree-sitter-verilog/verilog/src/parser.c"

-- | Statically-known rules corresponding to symbols in the grammar.
mkSymbolDatatype (mkName "Grammar") tree_sitter_verilog

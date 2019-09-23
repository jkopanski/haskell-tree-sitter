{-# LANGUAGE DeriveAnyClass, DeriveGeneric, DuplicateRecordFields, TemplateHaskell, TypeApplications #-}
module TreeSitter.Verilog.AST where

import TreeSitter.GenerateSyntax
import Prelude hiding (True, False, Float, Integer, String)
import qualified TreeSitter.Verilog as Grammar

astDeclarationsForLanguage Grammar.tree_sitter_verilog "../../vendor/tree-sitter-verilog/verilog/src/node-types.json"

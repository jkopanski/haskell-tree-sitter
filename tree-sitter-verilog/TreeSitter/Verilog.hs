{-# LANGUAGE TemplateHaskell #-}
module TreeSitter.Verilog
( tree_sitter_verilog
, getNodeTypesPath
) where

import Foreign.Ptr
import TreeSitter.Language
import Paths_tree_sitter_verilog

foreign import ccall unsafe "vendor/tree-sitter-verilog/verilog/src/parser.c tree_sitter_verilog" tree_sitter_verilog :: Ptr Language

getNodeTypesPath :: IO FilePath
getNodeTypesPath = getDataFileName "vendor/tree-sitter-verilog/verilog/src/node-types.json"

getTestCorpusDir :: IO FilePath
getTestCorpusDir = getDataFileName "vendor/tree-sitter-verilog/corpus"

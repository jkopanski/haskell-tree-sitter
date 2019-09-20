module TreeSitter.Verilog.Internal
( tree_sitter_verilog
) where

import Foreign.Ptr
import TreeSitter.Language

foreign import ccall unsafe "vendor/tree-sitter-verilog/verilog/src/parser.c tree_sitter_verilog" tree_sitter_verilog :: Ptr Language

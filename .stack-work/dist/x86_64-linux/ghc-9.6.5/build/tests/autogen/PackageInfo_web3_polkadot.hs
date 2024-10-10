{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module PackageInfo_web3_polkadot (
    name,
    version,
    synopsis,
    copyright,
    homepage,
  ) where

import Data.Version (Version(..))
import Prelude

name :: String
name = "web3_polkadot"
version :: Version
version = Version [1,0,1,0] []

synopsis :: String
synopsis = "Polkadot support for Haskell Web3 library."
copyright :: String
copyright = "(c) Aleksandr Krupenkin 2016-2021"
homepage :: String
homepage = "https://github.com/airalab/hs-web3#readme"

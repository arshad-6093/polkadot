{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_web3_polkadot (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,0,1,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/root/hs-web3/.stack-work/install/x86_64-linux/3213db94299184c74d4ef6e46643c48c71a62a46c347fe13ed892ca4b1e4e991/9.6.5/bin"
libdir     = "/root/hs-web3/.stack-work/install/x86_64-linux/3213db94299184c74d4ef6e46643c48c71a62a46c347fe13ed892ca4b1e4e991/9.6.5/lib/x86_64-linux-ghc-9.6.5/web3-polkadot-1.0.1.0-9vnd5Kw2cQ9X9AveKHGVt-tests"
dynlibdir  = "/root/hs-web3/.stack-work/install/x86_64-linux/3213db94299184c74d4ef6e46643c48c71a62a46c347fe13ed892ca4b1e4e991/9.6.5/lib/x86_64-linux-ghc-9.6.5"
datadir    = "/root/hs-web3/.stack-work/install/x86_64-linux/3213db94299184c74d4ef6e46643c48c71a62a46c347fe13ed892ca4b1e4e991/9.6.5/share/x86_64-linux-ghc-9.6.5/web3-polkadot-1.0.1.0"
libexecdir = "/root/hs-web3/.stack-work/install/x86_64-linux/3213db94299184c74d4ef6e46643c48c71a62a46c347fe13ed892ca4b1e4e991/9.6.5/libexec/x86_64-linux-ghc-9.6.5/web3-polkadot-1.0.1.0"
sysconfdir = "/root/hs-web3/.stack-work/install/x86_64-linux/3213db94299184c74d4ef6e46643c48c71a62a46c347fe13ed892ca4b1e4e991/9.6.5/etc"

getBinDir     = catchIO (getEnv "web3_polkadot_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "web3_polkadot_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "web3_polkadot_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "web3_polkadot_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "web3_polkadot_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "web3_polkadot_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'

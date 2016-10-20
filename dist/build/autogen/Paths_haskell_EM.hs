module Paths_haskell_EM (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/akira/haskell-EM/.cabal-sandbox/bin"
libdir     = "/home/akira/haskell-EM/.cabal-sandbox/lib/x86_64-linux-ghc-7.10.3/haskell-EM-0.1.0.0-7RRc7kxIOfSBQbdtxK2DnG"
datadir    = "/home/akira/haskell-EM/.cabal-sandbox/share/x86_64-linux-ghc-7.10.3/haskell-EM-0.1.0.0"
libexecdir = "/home/akira/haskell-EM/.cabal-sandbox/libexec"
sysconfdir = "/home/akira/haskell-EM/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "haskell_EM_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "haskell_EM_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "haskell_EM_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "haskell_EM_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "haskell_EM_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)

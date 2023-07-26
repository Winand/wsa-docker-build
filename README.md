# WSA builder for Docker
Run `docker-compose.yml` to build the latest WSA.

Various options can be set via `args` in `docker-compose.yml` (see `Dockerfile`).

Latest version of WSA can be checked on [store.rg-adguard.net](https://store.rg-adguard.net)
(ProductId: `9P3395VX91NR`).

See also [LSPosed/MagiskOnWSALocal](https://github.com/LSPosed/MagiskOnWSALocal).

Note: [EROFS is not supported in WSL](https://github.com/microsoft/WSL/issues/7257)
so WSA 2304-2305 cannot be built. [WSA 2306](https://github.com/microsoft/WSA/discussions/359)
switched back to EXT4. See also [#615](https://github.com/LSPosed/MagiskOnWSALocal/issues/615).

# backup
Directories in `$BACKUP_ROOT` are compressed, and dated tarballs are output into
`$BACKUP_OUT/<dirname>`. The resulting file tree looks something like this.

```
/
├── backup/
│   └── foo/
│       ├── bar.txt
│       └── baz.txt
└── out/
    └── foo/
        ├── 2021-02-27_00.tar.gz
        └── 2021-02-28_00.tar.gz
```
This is a one-off container that exits once a backup is complete. Use a cron job
or similar to run as often as you'd like.

## Available environment variables
- `BACKUP_ROOT` - location to look for input directories. Defaults to `/backup`.
- `BACKUP_OUT` - where to output compressed files. Defaults to `/out`.
- `ARGUMENTS` - Additional arguments to pass to `tar`. Useful for `--excludes`
or similar.

# Release Version

Create a clean release by bumping `package.json`, committing that bump, and creating a matching Git tag:

```bash
./release-version.sh patch
git push origin HEAD --tags
```

Use `major`, `minor`, `patch`, or an exact version like `1.2.3`.

The script uses `npm version`, so it updates `package.json` and `package-lock.json`, creates the release commit, and creates the matching Git tag. The Docker workflow uses that Git tag as the image version.

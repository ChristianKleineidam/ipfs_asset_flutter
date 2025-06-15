# Repository Instructions

## Flutter Setup

Use the `scripts/install_flutter.sh` script to download the Flutter SDK. Run:

```bash
bash scripts/install_flutter.sh
```

This clones the Flutter repository under `$HOME/flutter` and adds `$HOME/flutter/bin` to your `PATH`. If needed, run:

```bash
export PATH="$HOME/flutter/bin:$PATH"
```

Then verify with `flutter --version`.

**Note:** Install any additional software during the setup phase because network access granted for setup may not be available later in the run.
import os
import subprocess


def exec_(*args, **kwargs):
    """Wraps around the subprocess.check_output function and ignores an errors.
    """
    try:
        out = subprocess.check_output(*args, **kwargs)
    except subprocess.CalledProcessError as e:
        out = e.output
    return out


def fg(s, color=''):
    """Wraps a string with a ^fg()."""
    return "^fg(%s)%s^fg()" % (color, s)


def i(icon_path):
    """Returns an ^i(icon) given a path."""
    return "^i(%s)" % os.path.expandvars(icon_path)


def ca(script_path, s):
    """Runs a script for this clickable text.
    """
    return "^ca(%s)%s^ca()" % (script_path, s)

#!/usr/bin/python3
"""Fabric file that generates .tgz file"""

from fabric.api import local, env
from datetime import datetime

def do_pack():
    """Generates a .tgz archive from the contents of the web_static folder."""

    time_stamp = datetime.utcnow().strftime('%Y%m%d%H%M%S')
    file_name = f"versions/web_static_{time_stamp}.tgz"

    try:
        # Create the 'versions' directory if it doesn't exist
        local("mkdir -p versions")

        # Generate the .tgz archive using a timestamped filename
        local(f"tar -cvzf {file_name} web_static")

        return file_name  # Return the filename for further use if needed

    except:
        return None



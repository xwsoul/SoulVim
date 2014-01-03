import os
import vim
import sublime
from sublime import status_message, error_message
import sublime_plugin


class PHPTidyCommand(sublime_plugin.TextCommand):

    def run(self, edit):
        # check if is php file
        view = self.view
        if view.file_type() != 'php':
            error_message('Not a php file')
            return

        f = view.file_name()
        settings = sublime.load_settings('PHPTidy.sublime-settings')
        phpbin = settings.get("phpbin")
        plugindir = os.path.join(sublime.packages_path(), 'PHPTidy')
        scriptpath = os.path.join(plugindir, "phptidy.php")

        # check if phpbin is executable
        if not os.access(phpbin, os.X_OK):
            error_message('PHP bin file `%s` not found' % (phpbin))
            return

        # set script and check if it exists
        if not os.path.exists(scriptpath):
            error_message('Tidy script `%s` not found' % (scriptpath))
            return

        # call phptidy on file
        cmd = '%s "%s" format "%s"' % (phpbin, scriptpath, f)
        tidying = "Script tidying ..."
        status_message(tidying)
        retval = os.system(cmd)
        if retval == 0 or retval == 1:
            status_message(tidying + " Done.")
        else:
            status_message(tidying + " Failed.")
            if retval == 32512:
                error_message('PHPTidy cannot find the script at %s.'
                              % (scriptpath))
            else:
                error_message('There was an error calling the script at %s.'
                              ' Return value: %s' % (scriptpath, retval))

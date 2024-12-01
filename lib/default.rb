# frozen_string_literal: true

# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

use_helper Nanoc::Helpers::Blogging
use_helper Nanoc::Helpers::LinkTo
use_helper Nanoc::Helpers::Text
use_helper Nanoc::Helpers::Rendering
use_helper Nanoc::Helpers::Tagging

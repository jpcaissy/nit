# This file is part of NIT ( http://www.nitlanguage.org ).
#
# Copyright 2014 Romain Chanoir <romain.chanoir@viacesi.fr>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Services to load and play `Sound` and `Music` from the assets folder
#
# Get a handle to a sound using `new Sound` or `new Music` at any time.
# Call `load` at or after `App::on_create` or leave it to be loaded
# on demand by the first call to `play`.
module audio

import app_base
import core::error

# Platform variations
import linux::audio is conditional(linux)
import android::audio is conditional(android)

# Abstraction of a playable Audio
abstract class PlayableAudio

	# Path to the audio file in the assets folder
	var path: String

	# Last error on this sound, if any
	var error: nullable Error = null is writable

	# Is `self` already loaded?
	protected var is_loaded = false is writable

	# Load this playable audio
	fun load is abstract

	# Play the sound
	fun play is abstract

	# Pause the sound
	fun pause is abstract

	# Resume the sound
	fun resume is abstract
end

# Short sound
class Sound
	super PlayableAudio
end

# Long sound that can bee looped
class Music
	super PlayableAudio
end

# This file contains settings for Ollama and Open-WebUI.

{ config, pkgs, ...}:

{

# Ollama Configuration

	services.ollama = {
		enable = true;
		package = pkgs.ollama-vulkan;
	};

	systemd.services.ollama.serviceConfig = {
		environment = [ "OLLAMA_HOST=0.0.0.0:11434" ];
	};

# Open-WebUI

	services.open-webui = {
		enable = true;
		environment = {
			ANONYMIZED_TELEMETRY = "False";
			DO_NOT_TRACK = "True";
			SCARF_NO_ANALYTICS = "True";
			OLLAMA_API_BASE_URL = "http://127.0.0.1:11434/api";
			OLLAMA_BASE_URL = "http://127.0.0.1:11434";
		};
		port = 8080;
	};



}

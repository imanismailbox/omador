if [[ -v OMADOR_FIRST_RUN_OPTIONAL_APPS ]]; then
	apps=$OMADOR_FIRST_RUN_OPTIONAL_APPS

	if [[ -n "$apps" ]]; then
		for app in $apps; do
			source "$OMADOR_PATH/install/desktop/optional/app-${app,,}.sh"
		done
	fi
fi

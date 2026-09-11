{{*
  * Copyright (C) 2010-2026, the Friendica project
  * SPDX-FileCopyrightText: 2010-2026 the Friendica project
  *
  * SPDX-License-Identifier: AGPL-3.0-or-later
  *}}
{{* Template for single photo view *}}

{{* "live-photos" is needed for js autoupdate *}}
<div id="live-photos"></div>

<div id="photo-view-{{$id}}" class="generic-page-wrapper">
	<div class="photo-header-actions" style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; margin-bottom: 15px; gap: 10px;">
		<div id="photo-album-link-wrap">
			<a class="page-action faded-icon" id="photo-album-link" href="{{$album.0}}" style="font-size: 1.1em; font-weight: bold;">
				<i class="ri ri-folder-open-line"></i>
				{{$album.1}}
			</a>
		</div>
		<div id="photo-edit-link-wrap" style="display: flex; gap: 5px; flex-wrap: wrap; align-items: center;">
{{if $tools}}
	{{if $tools.view}}
		<a id="photo-view-link" class="btn btn-primary photo-back-link" href="{{$tools.view.0}}">
			<i class="page-action ri ri-reply-line"></i>
			 {{$back_text}}
		</a>
	{{/if}}
	{{if $tools.edit}}
		<a id="photo-edit-link" class="btn btn-primary" href="{{$tools.edit.0}}">
			 <i class="page-action ri ri-pencil-line"></i>
			 {{$edit_text}}
		</a>
	{{/if}}
	{{if $tools.delete}}
		<button id="photo-delete-link" class="btn btn-primary" type="button" data-modal-url="{{$tools.delete.0}}">
			<i class="page-action ri ri-delete-bin-line"></i>
			{{$delete_text}}
		</button>
	{{/if}}
	{{if $tools.profile}}
		<a id="photo-toprofile-link" class="btn btn-primary" href="{{$tools.profile.0}}">
			<i class="page-action ri ri-user-line"></i>
			{{$use_as_profile_picture_text}}
		</a>
	{{/if}}
	{{if $tools.usage}}
		<a id="photo-usage-link" class="btn btn-primary" href="{{$tools.usage.0}}">
			<i class="page-action ri ri-links-line"></i>
			{{$tools.usage.1}}
		</a>
	{{/if}}
	{{if $tools.lock}}
		<a id="photo-lock-link" onclick="lockview(event, 'photo', {{$id}});" title="{{$tools.lock}}" style="margin-left: 10px;">
			<i class="page-action ri ri-lg ri-lock-line faded-icon"></i>
		</a>
	{{/if}}
{{/if}}
		</div>
	</div>

	<div id="photo-view-wrapper">
		<div id="photo-photo" class="center-block">
			{{* The photo *}}
			<div class="photo-container">
				<a href="{{$photo.href}}" title="{{$photo.title}}" up-follow="false"><img src="{{$photo.src}}" alt="{{$photo.filename}}" width="{{$photo.lwidth}}" height="{{$photo.lheight}}"/></a>
			</div>

			{{* Overlay buttons for previous and next photo *}}
			{{if $prevlink}}
			<a class="photo-prev-link" href="{{$prevlink.0}}"><i class="ri ri-arrow-left-s-line" aria-hidden="true"></i></a>
			{{/if}}
			{{if $nextlink}}
			<a class="photo-next-link" href="{{$nextlink.0}}"><i class="ri ri-arrow-right-s-line" aria-hidden="true"></i></a>
			{{/if}}
		</div>

		<div id="photo-photo-end"></div>
		{{* The photo description *}}
		<div id="photo-caption">{{$desc}}</div>

		{{* The part for editing the photo - only available for the edit subpage *}}
		{{if $edit}}{{$edit nofilter}}{{/if}}

		<hr>
	</div>
</div>

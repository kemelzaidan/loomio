angular.module('loomioApp').factory 'AttachmentRecordsInterface', ($upload, BaseRecordsInterface, AttachmentModel) ->
  class AttachmentRecordsInterface extends BaseRecordsInterface
    model: AttachmentModel

    upload: (file, progress, success, failure) ->
      $upload.upload(
        url: @remote.collectionPath()
        method: 'POST'
        data:
          'attachment[filename]': file.name.replace(/[^a-z0-9_\-\.]/gi, '_')
        file: file
        fileFormDataName: 'attachment[file]'
      ).progress(progress)
       .error(failure)
       .abort(failure)
       .success(success)

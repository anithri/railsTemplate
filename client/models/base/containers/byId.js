import { createContainer } from 'client/models/base/container'
import { queryById, extractData } from 'client/models/base/utils'

import cc from 'change-case'

export const createByIdContainer = args => {
  const { concern, concernId, parser } = args
  const id = concernId || cc.camel(concern) + 'Id'

  return createContainer({
    displayName: cc.pascal(concern) + 'Container',
    preQuery: queryById(id),
    postQuery: extractData(concern, parser),
    concernId: id,
    ...args,
  })
}

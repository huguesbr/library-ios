//
//  HBRWeakSelf.h
//  yerdle2
//
//  Created by Hugues Bernet-Rollande on 8/5/13.
//  Copyright (c) 2013 Yerdle. All rights reserved.
//

#ifndef HBRWeakSelf_h
#define HBRWeakSelf_h

#define Weakify(o) __weak __typeof__((__typeof__(o))o)
#define WeakifySelf(o) Weakify(self) o = self;

#endif

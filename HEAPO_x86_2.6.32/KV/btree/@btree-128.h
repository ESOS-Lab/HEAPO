/*
  Persistent Object Store

  Author: Taeho Hwang (htaeh@hanynag.ac.kr)
  Embedded Software Systems Laboratory, Hanyang University
*/


extern struct btree_geo btree_geo128;

//struct btree_head128 { struct btree_head h; };

/*static inline void btree_init_mempool128(struct btree_head128 *head,
					 mempool_t *mempool)
{
	btree_init_mempool(&head->h, mempool);
}*/

/*static inline int btree_init128(struct btree_head128 *head)
{
	return btree_init(&head->h);
}*/
static inline int btree_init128(char *name)
{
	return btree_init(name);
}

/*static inline void btree_destroy128(char *name)
{
	btree_destroy(name);
}*/
static inline void btree_destroy128(char *name)
{
	btree_destroy(name);
}

int btree_open128(char *name)
{
	btree_open(name);
}

void btree_close128(char *name)
{
	btree_close(name);
}

/*static inline void *btree_lookup128(struct btree_head128 *head, u64 k1, u64 k2)
{
	u64 key[2] = {k1, k2};
	return btree_lookup(&head->h, &btree_geo128, (unsigned long *)&key);
}*/
static inline void *btree_lookup128(char *name, unsigned long k1, unsigned long k2)
{
	unsigned long key[2] = {k1, k2};
	return btree_lookup(name, &btree_geo128, (unsigned long *)&key);
}

/*static inline void *btree_get_prev128(struct btree_head128 *head,
				      u64 *k1, u64 *k2)
{
	u64 key[2] = {*k1, *k2};
	void *val;

	val = btree_get_prev(&head->h, &btree_geo128,
			     (unsigned long *)&key);
	*k1 = key[0];
	*k2 = key[1];
	return val;
}*/

/*static inline int btree_insert128(struct btree_head128 *head, u64 k1, u64 k2,
				  void *val, gfp_t gfp)
{
	u64 key[2] = {k1, k2};
	return btree_insert(&head->h, &btree_geo128,
			    (unsigned long *)&key, val, gfp);
}*/
static inline int btree_insert128(char *name, unsigned long k1, unsigned long k2,
				  void *val)
{
	unsigned long key[2] = {k1, k2};
	return btree_insert(name, &btree_geo128,
			    (unsigned long *)&key, val);
}


/*static inline int btree_update128(struct btree_head128 *head, u64 k1, u64 k2,
				  void *val)
{
	u64 key[2] = {k1, k2};
	return btree_update(&head->h, &btree_geo128,
			    (unsigned long *)&key, val);
}*/
static inline int btree_update128(char *name, unsigned long k1, unsigned long k2,
				  void *val)
{
	unsigned long key[2] = {k1, k2};
	return btree_update(name, &btree_geo128,
			    (unsigned long *)&key, val);
}

/*static inline void *btree_remove128(struct btree_head128 *head, u64 k1, u64 k2)
{
	u64 key[2] = {k1, k2};
	return btree_remove(&head->h, &btree_geo128, (unsigned long *)&key);
}*/
static inline void *btree_remove128(char *name, unsigned long k1, unsigned long k2)
{
	unsigned long key[2] = {k1, k2};
	return btree_remove(name, &btree_geo128, (unsigned long *)&key);
}

/*
static inline void *btree_last128(struct btree_head128 *head, u64 *k1, u64 *k2)
{
	u64 key[2];
	void *val;

	val = btree_last(&head->h, &btree_geo128, (unsigned long *)&key[0]);
	if (val) {
		*k1 = key[0];
		*k2 = key[1];
	}

	return val;
}

static inline int btree_merge128(struct btree_head128 *target,
				 struct btree_head128 *victim,
				 gfp_t gfp)
{
	return btree_merge(&target->h, &victim->h, &btree_geo128, gfp);
}

void visitor128(void *elem, unsigned long opaque, unsigned long *__key,
		size_t index, void *__func);

typedef void (*visitor128_t)(void *elem, unsigned long opaque,
			     u64 key1, u64 key2, size_t index);

static inline size_t btree_visitor128(struct btree_head128 *head,
				      unsigned long opaque,
				      visitor128_t func2)
{
	return btree_visitor(&head->h, &btree_geo128, opaque,
			     visitor128, func2);
}

static inline size_t btree_grim_visitor128(struct btree_head128 *head,
					   unsigned long opaque,
					   visitor128_t func2)
{
	return btree_grim_visitor(&head->h, &btree_geo128, opaque,
				  visitor128, func2);
}

#define btree_for_each_safe128(head, k1, k2, val)	\
	for (val = btree_last128(head, &k1, &k2);	\
	     val;					\
	     val = btree_get_prev128(head, &k1, &k2))
*/

